import dash
from dash import dcc
from dash import html
from dash.dash_table import DataTable  # Corrección aquí
import dash_bootstrap_components as dbc
import pandas as pd
import plotly.express as px
from utildb import getengine


# Crear el motor de conexión
engine = getengine()

# Utilizar el motor para realizar las consultas
query_canales = "SELECT * FROM [CSF_PEMARELLA].[dbo].[PS_Canales]"
query_arqprod1_agrupado = '''
SELECT codigonivel1, codigonivel2, codigonivel3, codigonivel4, COUNT(*) AS conteo
FROM [CSF_PEMARELLA].[dbo].[PS_ArqProd1]
GROUP BY codigonivel1, codigonivel2, codigonivel3, codigonivel4
'''
query_cheques_por_banco = '''
SELECT 
    PS_Cheques.codigobanco, 
    PS_Bancos.descrip AS NombreBanco,
    COUNT(*) AS TotalCheques,
    SUM(CAST(PS_Cheques.importe AS FLOAT)) AS TotalImporte
FROM 
    PS_Cheques 
INNER JOIN 
    PS_Bancos ON PS_Cheques.codigobanco = PS_Bancos.codigo
GROUP BY 
    PS_Cheques.codigobanco, 
    PS_Bancos.descrip
'''

df_canales = pd.read_sql(query_canales, engine)
df_arqprod1_agrupado = pd.read_sql(query_arqprod1_agrupado, engine)
df_cheques_por_banco = pd.read_sql(query_cheques_por_banco, engine)

# Cerrar la conexión al motor
engine.dispose()

# Crear gráficos con Plotly Express
fig = px.pie(df_arqprod1_agrupado, names='codigonivel1', values='conteo', title='Distribución por Codigonivel1')
fig_pie = px.pie(df_cheques_por_banco, values='TotalImporte', names='NombreBanco', title='Distribución del Total de Importes por Banco')

# Inicializar la aplicación Dash
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Definir la estructura HTML del dashboard
app.layout = html.Div([
    dbc.Navbar(
        [
            dbc.Row(
                [
                    dbc.Col(html.Img(src="/assets/logo.png", height="50px"), width="auto"),
                    dbc.Col(dbc.NavbarBrand("Dashboard SPA-ETL", className="ml-2"), width="auto"),
                ],
                align="center",
                className="g-0",
            ),
            dbc.NavbarToggler(id="navbar-toggler"),
        ],
        color="rgb(29, 36, 61)",  # Color del Navbar
        dark=True,
        className="mb-5",  # Margen inferior para separar del contenido
    ),
    html.Div([
        html.H1('Dashboard de Reportes'),
        
        html.H2('Reporte de Canales'),
        DataTable(
            id='tabla-canales',
            columns=[{"name": i, "id": i} for i in df_canales.columns],
            data=df_canales.to_dict('records'),
            style_table={'overflowX': 'auto'},
            page_size=10
        ),
        
        html.H2('Distribución de ArqProd1 por Codigonivel1'),
        dcc.Graph(
            id='grafico-arqprod1-pie',
            figure=fig
        ),
        
        html.H2('Detalle de ArqProd1'),
        DataTable(
            id='tabla-arqprod1',
            columns=[{"name": i, "id": i} for i in df_arqprod1_agrupado.columns],
            data=df_arqprod1_agrupado.to_dict('records'),
            style_table={'overflowX': 'auto'},
            page_size=10
        ),
        
        html.H2('Total de Cheques y Suma de Importes por Banco'),
        DataTable(
            id='tabla-cheques-por-banco',
            columns=[{"name": i, "id": i} for i in df_cheques_por_banco.columns],
            data=df_cheques_por_banco.to_dict('records'),
            style_table={'overflowX': 'auto'},
            page_size=10
        ),

        html.H2('Distribución del Total de Importes por Banco'),
        dcc.Graph(
            id='grafico-importe-por-banco',
            figure=fig_pie
        )
    ], className="p-4"),
])

# Correr el servidor
if __name__ == '__main__':
    app.run_server(debug=True)

from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Image, Table, TableStyle, Spacer, Paragraph
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib import colors

def COAReportGen(sample, measurement, filename, userName):
    styles = getSampleStyleSheet()
    width, height = letter

    doc = SimpleDocTemplate(filename, pagesize=letter)

    elements = []

    header_img = Image("coaheader.png", width=width, height=0.5 * inch)
    elements.append(header_img)

    sample_header = [
        ["Grade", "TechnicalGrade", "Customer", "Ordernumber_PVS", "Ordernumber_Client", "SampleDate", "Bruto",
         "TestDate", "BatchNumber", "ContainerNumber", "Onedecimal"],
        [sample['Grade'], sample['TechnicalGrade'], sample['Customer'], sample['Ordernumber_PVS'],
         sample['Ordernumber_Client'], sample['SampleDate'], sample['Bruto'], sample['TestDate'],
         sample['BatchNumber'], sample['ContainerNumber'], sample['Onedecimal']]
    ]
    sample_table = Table(sample_header, colWidths=[1.5 * inch] * 11)
    elements.extend([sample_table, Spacer(1, 0.2 * inch)])

    measurement_header = [
        ["Test", "Element", "Test Results", "", "Min", "Max", "Unit"]
    ]
    measurement_data = []
    for i in range(len(measurement)):
        test_results = measurement['TestResults'][i]
        if measurement['Typevar'][i] == 'I':
            if measurement['Less'][i]:
                test_results = "<" + str(test_results)
        else:
            test_results = measurement['Listvalue'][i]
        measurement_data.append([
            measurement['Test'][i], measurement['Element'][i], test_results, "", measurement['Min'][i],
            measurement['Max'][i], measurement['Unit'][i]
        ])

    measurement_table = Table(measurement_header + measurement_data, colWidths=[1 * inch] * 7)
    measurement_table.setStyle(TableStyle([
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('VALIGN', (0, 0), (-1, -1), 'MIDDLE')
    ]))
    elements.extend([measurement_table, Spacer(1, 0.2 * inch)])

    footer_img = Image("coafooter.png", width=width, height=0.5 * inch)
    elements.append(footer_img)

    doc.build(elements)


# Example usage:
# Make sure to replace 'sample' and 'measurement' with the respective DataFrame variables containing your data
sample = {'Grade': 'YourGrade', 'TechnicalGrade': 'YourTechnicalGrade', 'Customer': 'YourCustomer',
          'Ordernumber_PVS': 'YourOrdernumber_PVS', 'Ordernumber_Client': 'YourOrdernumber_Client',
          'SampleDate': 'YourSampleDate', 'Bruto': 'YourBruto', 'TestDate': 'YourTestDate',
          'BatchNumber': 'YourBatchNumber', 'ContainerNumber': 'YourContainerNumber', 'Onedecimal': 'YourOnedecimal'}
measurement = {'Test': ['Test1', 'Test2'], 'Element': ['Element1', 'Element2'],
               'TestResults': [10, 20], 'Min': [5, 15], 'Max': [15, 25], 'Unit': ['Unit1', 'Unit2'],
               'Less': [True, False], 'Typevar': ['I', 'I'], 'Listvalue': [None, None]}
filename = "COAReport.pdf"
userName = "YourUserName"
COAReportGen(sample, measurement, filename, userName)

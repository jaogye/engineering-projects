from scipy.optimize import minimize

# Define the goal function to minimize
def goal_function(x):
    return (x[0] - 1)**2 + (x[1] - 2)**2

# Define the constraint functions
def constraint1(x):
    return x[0] + x[1] - 3  # Constraint: x + y = 3

def constraint2(x):
    return x[0]**2 + x[1]**2 - 4  # Constraint: x^2 + y^2 = 4

# Define the initial guess
initial_guess = [0, 0]

# Define the bounds for variables (optional)
bounds = ((-10, 10), (-10, 10))

# Define the constraints
constraints = ({'type': 'eq', 'fun': constraint1},
               {'type': 'eq', 'fun': constraint2})

# Minimize the goal function subject to constraints
result = minimize(goal_function, initial_guess, bounds=bounds, constraints=constraints)

# Print the result
print("Optimal solution:", result.x)
print("Optimal value of the goal function:", result.fun)

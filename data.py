# import random
# import faker

# # Initialize faker instance
# fake = faker.Faker()

# # Create lists for enum fields
# company_domain = "dracercorp.org"
# statuses = ['employed', 'sacked', 'retired']
# sexes = ['male', 'female']
# realistic_banks = [
#     'Zenith Bank', 'Access Bank', 'Standard IBTC', 'UBA', 'Union Bank', 'Polaris Bank'
# ]

# # Function to generate SQL INSERT statement with adjustments
# def generate_adjusted_insert_queries(num_records=100):
#     queries = []
#     for i in range(num_records):
#         first_name = fake.first_name()
#         last_name = fake.last_name()
#         # Updated email domain
#         email = f"{first_name.lower()}.{last_name.lower()}.{i+1}@{company_domain}"
#         password = fake.password(length=10)
#         address = fake.address().replace("\n", " ")
#         employment_date = fake.date_time_between(start_date="-10y", end_date="now")
#         status = random.choice(statuses)
#         terminated_date = fake.date_time_between(start_date=employment_date, end_date="now") if status != "employed"  else 'NULL'
#         # Generate a more realistic account number
#         account_number = random.randint(100000000, 999999999)
#         bank = random.choice(realistic_banks)
#         postal_code = random.randint(100000, 999999)
#         sex = random.choice(sexes)
        
#         # Create SQL values
#         query = f"('{first_name}', '{last_name}', '{email}', '{password}', '{address}', '{employment_date}', "
#         query += f"'{terminated_date}'" if terminated_date else "NULL"
#         query += f", '{status}', {account_number}, '{bank}', {postal_code}, '{sex}')"
        
#         queries.append(query)
    
#     # Combine into a full INSERT statement
#     sql_query = f"INSERT INTO `employee` (`firstname`, `lastname`, `email`, `password`, `address`, `employment_date`, `terminated_date`, `employment_status`, `account_number`, `bank`, `postal_code`, `sex`)\nVALUES\n"
#     sql_query += ",\n".join(queries) + ";"
#     return sql_query

# # Generate the adjusted queries
# adjusted_generated_queries = generate_adjusted_insert_queries(100)

# # Save the adjusted queries to a file
# adjusted_file_path = "insert_employee.sql"
# with open(adjusted_file_path, "w") as file:
#     file.write(adjusted_generated_queries)

# adjusted_file_path


# import random
# import faker

# fake = faker.Faker()
# # Define job titles and departments
# job_titles = [
#     "Manager", "Assistant Manager", "Analyst", "Developer", "Consultant",
#     "Technician", "Engineer", "Coordinator", "Officer", "Specialist", 
#     "Administrator", "Director", "Supervisor", "Executive", "Advisor"
# ]
# departments_ids = range(1, 12)  # Assuming department IDs from 1 to 11

# # Function to generate random jobs
# def generate_job_inserts(num_employees=100):
#     queries = []
#     for employee_id in range(1, num_employees + 1):
#         num_jobs = random.randint(1, 3)  # Each employee can have 1 to 3 jobs
#         for _ in range(num_jobs):
#             department_id = random.choice(departments_ids)
#             job_title = random.choice(job_titles)
#             start_date = fake.date_time_between(start_date="-10y", end_date="now")
#             end_date = fake.date_time_between(start_date="-10y", end_date="now") if random.random() > 0.5 else 'NULL'
#             salary = round(random.uniform(2500, 15000), 2)  # Salary between 2500 and 15000
#             pension_percentage = round(random.uniform(5, 15), 2)  # Pension percentage between 5% and 15%

#             # Create SQL values
#             query = f"({employee_id}, {department_id}, '{job_title}', '{start_date}', '{end_date}', {salary}, {pension_percentage})" 
#             queries.append(query)
    
#     sql_query = f"INSERT INTO jobs (employee_id, department_id, job_title, start_date, end_date, salary, pension_percentage)\nVALUES\n"

#     sql_query += ",\n".join(queries) + ";"
#     return sql_query

# # Generate job inserts for 100 employees
# job_queries = generate_job_inserts()

# # Save to a file
# jobs_file_path = "insert_jobs_for_employees.sql"
# with open(jobs_file_path, "w") as file:
#     file.write(job_queries)

# jobs_file_path





import random
import faker

# Initialize faker instance
fake = faker.Faker()

# Create lists for enum fields
statuses = ['eligible', 'not eligible']

# Function to generate SQL INSERT statement with adjustments
def generate_adjusted_insert_queries(employee_ids=100):
    queries = []
    for employee_id in range(1, employee_ids+1):
        status = random.choice(statuses)
        start_date = fake.date_time_between(start_date="-10y", end_date="now") if random.random() < 0.5 else "NULL"
        stop_date = fake.date_time_between(start_date=start_date, end_date="now") if status != "eligible" and start_date != "NULL" else 'NULL'
        last_paid_date = fake.date_time_between(start_date=start_date, end_date="now") if stop_date != "NULL" else 'NULL'
        
        # Create SQL values
        query = f"('{employee_id}', '{status}', '{start_date}', '{stop_date}', '{last_paid_date}')"
        
        queries.append(query)
    
    # Combine into a full INSERT statement
    sql_query = f"INSERT INTO `pensioneer` (`employee_id`, `pension_status`, `start_date`, `stop_date`, `last_paid_date`)\nVALUES\n"
    sql_query += ",\n".join(queries) + ";"
    return sql_query

# Generate the adjusted queries
adjusted_generated_queries = generate_adjusted_insert_queries(100)

# Save the adjusted queries to a file
adjusted_file_path = "insert_pension.sql"
with open(adjusted_file_path, "w") as file:
    file.write(adjusted_generated_queries)

adjusted_file_path

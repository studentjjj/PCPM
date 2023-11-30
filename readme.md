**Notes**  <br>
T_ indicates that these files are to grab Tuberculosis patients only <br>
t_sql .txt --> SQL scripts used in Postgres for data preprocessing  <br>
CQL files are used to import exported Postgres CSV files after data preprocessing <br>
JSON file is dashboard <br>

------------------------------------------------------------------------------------------


Methodology


--- Data Preprocessing --- <br>
The dataset that was used as the case study for this project was the MIMIC-IV dataset. MIMIC-IV (v2.2) is a comprehensive medical database compiled by 
Johnson et al. (2023) that contains deidentified electronic health records and other medical data. It is publicly available online through its publisher,
PhysioNet, after a short training course and signing the data user agreement. 
To graph patient care pathways, the MIMIC-IV database needed to be transformed from a relational database to a graph database.  


--- Data Import and Transformation --- <br> 
Firstly, the MIMIC-IV dataset was imported onto PostgreSQL using the official guide and scripts provided in the MIMIC Code Repository. Once set up,
an entity relationship diagram was generated to visualise and understand the defined relationships and constraints among the tables. 
A graph data model was translated from the entity relationship diagram as a foundational framework for developing the graph database on Neo4j. The 
process involved converting data rows into nodes, tables into label names, and linkages and joins into relationships. 

When translating the entity relationship diagram to a graph data model, alterations were made to the database. Lookup tables were merged with 
corresponding tables to reduce computational complexity and remove redundant relationships. The links between the tables and the Patients and Admissions 
tables were modified by removing the relationship to the Patients table, establishing the Admissions table as the exclusive centralising node. Removing the 
relationships from the Patients table reduced the number of redundant relationships and reduced computational complexity. Due to limited computational power,
the database was narrowed down to patients with tuberculosis and some tables were excluded. 


--- Prototype Development --- <br>
Establishing MIMIC-IV Network <br>
To graph patient care pathways, the database must be reconstructed as a network. 
Neo4j was chosen to store the MIMIC-IV database and run the dashboard.  Neo4j relies on Cypher as its graph query language.

Firstly, the transformed data was exported from PostgreSQL as CSV files and imported into Neo4j. Data rows were extracted and 
imported as nodes with table names as node labels and field values as properties. 
Once nodes were created, indexes were set based on the MIMIC code repository.
Then, relationships were established based on the graph model created. 

Dashboard  <br>
To create the dashboard, Neodash, an application within Neo4j, was used. It is an open-source tool to visualise data directly from the 
Neo4j databases. It can be used to build interactive dashboards using advanced graphs and easy sharing via JSON files. Neodash connects 
directly to the Neo4j databases and runs queries. 


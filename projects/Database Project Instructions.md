# Project 1: Database Design, Creation and Queries

## Introduction

In this project you will create a database from scratch, including designing a relational database, using SQL Server Data Tools to create the database, inserting data into it and making queries. This is an open-ended group project.

The project is due **11:59 PM on Friday, 3/16**.

### Skills Emphasized:

- Relational database design
- SQL - Data Definition Language (DDL)
- SQL - Manipulation Language (DML)
- Version control and collaboration using GitHub 

### Teaming Logistics:

- You must work in a team of exactly three students.
- You can use #random channel in Slack to group team or recruit team members.
- Only one of you should create Github repo for this project. The one that creates the repo should then add the other team members as collaborators on Github for that repo.


## What you need to do

### 1. Relational database design (25 points)

Design a relational database (not datawarehouse) for any company (or any website or any app). It could be an existing company (website, app) or an imaginary one. 

**Deliverable 1:** Powerpoint or Word Document or Markdown file (recommended, but you need to learn how to add images in .md file.) Name the file something like *teamname_dbdesign.pptx(or .docx or .md)*.

- Use at least one paragraph to introduce the background of the company. List all the team members in another paragraph.

- Think about the relational database design for this company and simplify it. This database should represent the core business of this company.

- Identify the entities involved, their attributes, and the relationships among them. 

- Draw a 'peudo' entity-relationship diagram that captures your thinking. You may either draw your diagram by hand or using MS PowerPoint (or MS Word). The diagram should include at least 4 tables. 

- For each table, list the columns/fields it contains.  

- Indicate which field(s) is/are the primary key(s) using the letters PK, and which fields are foreign keys, denoted by the letters FK.  

- Identify all 1 to many relationships. Add assumptions when neccesary. 


### 2. Database creation (25 points)

Use Visual Studio 2017 (with SQL Server Data Tools) to implement the database you designed using SQL statements. 

**Deliverable 2:** SQL script. Name your script something like *teamname_dbcreation.sql*.

- Add team name and names of team members in comment block.

- Create database. Choose a meaningful name for your database.

- Create tables. The tables should contain exactly same columns as in deliverable 1. 

- Specify primary keys.

- Specify foreign keys.

- Create fake data and insert into corresponding tables. Make sure each table has at least 10 records. Make sure you can use data to finish queries in part 3.

- You can create views to make queries easier. However, make sure you understand what view is for and how to create view before you decide to do so. Creating views is not mandatory.

- You can get help from w3shools.com (<https://www.w3schools.com/sql/default.asp>)

### 3. SQL Queries (30 points)
Use Visual Studio 2017 (with SQL Server Data Tools) to make queries in the database you designed and created using SQL statements.

**Deliverable 3:** SQL script. Name your script something like *teamname_dbqueries.sql*.

You have to create the following queries. For each query, you need to use comment block to describe what data you are looking for.  Below are requirements for each query:

1. Multiple `SELECT *` queries to display all the records from each table. (Suppose the database has 4 tables, you should create 4 queries for this requirement.)

2. A query that uses aggregate function.

3. A query that selects records from two (or multiple) tables using `INNER JOIN`.

4. A query that selects records from two (or multiple) tables using `LEFT OUTER JOIN` (or `RIGHT OUTER JOIN` or `FULL OUTER JOIN`). Specify why outer join is neccesary in comment block. Make sure your fake data could reflect the necessity. If it could not, you need to go back to part 2 to redo the data insertion, or you can use `INSERT INTO`, `UPDATE` or `DELETE` statements to modify the existing data.

5. A query that uses subquery.

Add team name and names of team members in comment block.


### 4. Reflection (20 points)

Please prepare a short document with the following sections:

**Deliverable 4:** Word document. Name it *teamname_relfection.docx*.

- From a process point of view, what went well? What could you improve? Other possible reflection topics: Was your project appropriately scoped? What self-studying did you do? How will you use what you learned going forward? What do you wish you knew before you started that would have helped you succeed?

- Also discuss your team process in your reflection. How did you plan to divide the work (e.g. split by deliverables, always work together, etc.) and how did it actually happen? Were there any issues that arose while working together, and how did you address them? What would you do differently next time?

## Turning in your assignment
1. Your GitHub repository should have at least 4 files: *teamname_dbdesign.pptx(or .docx or .md)*, *teamname_dbcreation.sql*, *teamname_dbqueries.sql* and *teamname_relfection.docx*. 

2. Zip all the files into *teamname_project1.zip*. Upload it to Blackboard. In the comment area on Blackboard, specify names of all team members and url of GitHub repository. **Everyone in the team needs to submit the zip file to Blackboard and add comment.**

3. The project is due 11:59 PM on Friday, 3/16.



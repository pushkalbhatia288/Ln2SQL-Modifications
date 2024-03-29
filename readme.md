### Readme File
This Readme is the basic readme through which one can understand how to run ln2sql for a natural language text, and also undertand the basic working very briefly. Further links are provided for detailed understanding.

#### How to run a basic command 
* To run a query open terminal and run the command mentioned below -
  * **The general syntax followed is:**  
         
        python3 -m ln2sql.main -d <path> -l <path> -i <input-sentence> [-j <path>] [-t <path>]
  * **Parameters:**

        -h					print this help message
        -d <path>				path to sql dump file
        -l <path>				path to language configuration file
        -i <input-sentence>			input sentence to parse
        -j <path>				path to JSON output file
        -t <path>				path to thesaurus file
  *  **Example and result:**  
               
         python3 -m ln2sql.main -d city.sql -l english.csv -t th_english.dat -j output.json -i "What are the cities whose score is less than 5?"

  * **Result displayed after running the command (also saved in output.json):**  

		SELECT COUNT(*)
		FROM city
		INNER JOIN emp
		ON city.id = emp.cityId
		WHERE emp.score < '5';

This can be further customized to run more than one query. (Will be done in near future, to try and test different sample queries)

#### Brief Explanation:

1. **File importance**:
* *th_english.dat*: This file is the thesaurus file for us, which acts as a dictionary to deal with synonyms or word plurality. 
* *city.sql*: This is the sql dump file, having the complete structure of the database in the form of backup (Thus contains necessary data required by the tool to understand the tables and columns)
* *english.csv*: This file contains Most English words required by SQL software and their synonyms widely used (For example, sort, sorted, grouped for "group by").
(All these files are customizable)

2. **Working**
* The project follows a MVC model type, where model deals with forming the query, according to the parsing generated by Controller. The tool takes in input a database model and a sentence and translate the latter in a valid SQL statement able to query the input data model.

* The main file uses "arg_parser = argparse.ArgumentParse" to run the command through terminal and captures various paths for thesaurus, language and the sql dump file you want to use. It collects these and then further calls ln2sql.py to set the values of these attributes.

* From there, further files are called which parses the sentence, dividing it into parts and matching with the Database keywords. While doing this, it forms a query a well. 

* For example if first part of the sentence has a given keyword say "How many", it detects that the text has to do something wit "Count" and hence adds the keyword with select query.

* Link to diagramatic explanation: https://raw.githubusercontent.com/FerreroJeremy/ln2sql/master/docs/mvc_class_diagram.png

* Github Link to entire Project: https://github.com/FerreroJeremy/ln2sql/blob/master/README.md

#### Updates:

1. Fixed the following errors:
* Multiple select with aggregate
* Selecting group by column name
* Include word phrases for specific table/column names
* Issue where Count always appeared in select statement




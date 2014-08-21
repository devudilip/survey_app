# seed to add predefined data types 
fields =  ["Essay","Numeric","Date","Radio Button","Check Box"]
fields.collect{ |field| CustomField.create(name: field) }

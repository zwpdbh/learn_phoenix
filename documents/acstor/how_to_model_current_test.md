# How to model current test 

We need to track test result in web service to track: 

- The workload and acstor test coverage.
- The workload and the bug created by user.

## ACStor storage type 
- id (uuid)
- name 


## ACStor test feature
- id
- name 
- supported features: multiple selection from ACStor storage type 

So, for one ACStor storage type, it could have multiple ACStor test feature


## sceanrio run instance attribute 
- id (uuid)
- start time, 
- end time, could be nil 
- status, could be: in progress, canceled, succeed, failed.
- workload id (uuid)

## Workload attribute
- id (uuid)
- name 
- feature id 

## ACStor bug attribute 
- id (uuid)
- workload_id (uuid), from Workload,
- description: string



## relationship

- One workload definition have many scenario run instance. One scenario run instance belong to one workload definition.
- One test feature could have many workload definitions. One workload definition belong to one test feature.

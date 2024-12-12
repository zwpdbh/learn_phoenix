# How to model current test 

We need to track test result in web service to track: 

- The workload and acstor test coverage.
- The workload and the bug created by user.

## ACStor test feature attribute
- id (uuid)
- name 
- storage_type: string

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
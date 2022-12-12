#!/usr/bin/env nextflow

nextflow.enable.dsl=2

requiredParams = [
    'input', 'output'
]

for (param in requiredParams) {
    if (params[param] == null) {
      exit 1, "Parameter ${param} is required."
    }
}



// DEFINE PATHS # these are strings which are used to define input Channels,
// but they are specified here as they may be referenced in LOGGING
file1 = file("/path/to/file1.file", checkIfExists: true, glob: false)
file2 = file("${params.some_parameter}", checkIfExists: true, glob: false)




////////////////////
// STAGE CHANNELS //
////////////////////




////////////////////
// BEGIN PIPELINE //
////////////////////

include {PARSE_SAMPLE_SHEET} from '../processes/parse_sample_sheet.nf'

// SUB-WORKFLOWS
workflow ANALYSE_RUN {

    PARSE_SAMPLE_SHEET()
}
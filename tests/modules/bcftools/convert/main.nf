#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { BCFTOOLS_CONVERT as BCFTOOLS_CONVERT_GVCF } from '../../../../modules/bcftools/convert/main.nf'
include { BCFTOOLS_CONVERT as BCFTOOLS_CONVERT_BCF  } from '../../../../modules/bcftools/convert/main.nf'

workflow test_bcftools_convert_gvcf {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['homo_sapiens']['illumina']['test_genome_vcf'], checkIfExists: true),
        []
    ]

    bed = []

    fasta = file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true)

    BCFTOOLS_CONVERT_GVCF ( input, bed, fasta )
}

workflow test_bcftools_convert_gvcf_bed {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['homo_sapiens']['illumina']['test_genome_vcf_gz'], checkIfExists: true),
        file(params.test_data['homo_sapiens']['illumina']['test_genome_vcf_gz_tbi'], checkIfExists: true)
    ]

    bed = file(params.test_data['homo_sapiens']['genome']['genome_bed'], checkIfExists: true)

    fasta = file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true)

    BCFTOOLS_CONVERT_GVCF ( input, bed, fasta )
}

workflow test_bcftools_convert_gvcf_to_bcf {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['homo_sapiens']['illumina']['test_genome_vcf'], checkIfExists: true),
        []
    ]

    bed = []

    fasta = file(params.test_data['homo_sapiens']['genome']['genome_fasta'], checkIfExists: true)

    BCFTOOLS_CONVERT_BCF ( input, bed, fasta )
}

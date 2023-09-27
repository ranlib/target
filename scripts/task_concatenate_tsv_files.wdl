version 1.0

task task_concatenate_tsv_files {
  input {
    Array[File] input_files
    String output_file_name = "concatenated.tsv"
    String docker = "dbest/lims_report:v1.0.3"
  }

  command <<<
    set -x
    python -c "
    import sys
    import pandas
    outf = sys.argv[1]
    tsvs = sys.argv[2:]
    dfs = [pandas.read_csv(tsv, sep='\t') for tsv in tsvs]
    concatenated_df = pandas.concat(dfs)
    concatenated_df.to_csv(outf, sep='\t', index=False)
    " ~{output_file_name} ~{sep=" " input_files}
  >>>

  output {
    File tsv = output_file_name
  }

  runtime {
    docker: docker
  }
}

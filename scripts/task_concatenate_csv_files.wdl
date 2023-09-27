version 1.0

task task_concatenate_csv_files {
  input {
    Array[File] input_files
    String output_file_name = "concatenated.csv"
    String docker = "dbest/lims_report:v1.0.3"
  }

  command <<<
    set -x
    python -c "
    import sys
    import pandas
    outf = sys.argv[1]
    csvs = sys.argv[2:]
    dfs = [pandas.read_csv(csv) for csv in csvs]
    concatenated_df = pandas.concat(dfs)
    concatenated_df.to_csv(outf, index=False)
    " ~{output_file_name} ~{sep=" " input_files}
  >>>

  output {
    File csv = output_file_name
  }

  runtime {
    docker: docker
  }
}

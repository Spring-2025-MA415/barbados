# drops columns that contain only one value
drop_one_value_col <- function(df) { 
    result <- df[, sapply(df, function(col) length(unique(col)) > 1)]
    return(result)
  }
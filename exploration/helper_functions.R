# drops columns that contain only one value
drop_one_value_col <- function(df) { 
    result <- df[, sapply(df, function(col) length(unique(col)) > 1)]
    return(result)
}

drop_one_value_col_except_IND_NAME <- function(df) { 
  result <- df[, sapply(df, function(col) {
    # Keep "IND_NAME" even if it has only one unique value
    if (length(unique(col)) == 1 && names(df)[which.max(sapply(df, identical, col))] == "IND_NAME") {
      return(TRUE)
    }
    return(length(unique(col)) > 1)
  })]
  return(result)
}


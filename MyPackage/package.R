rows <- 100
cols <- 3
default_rand = c(sample(1:100, rows))
default_rand
default_letters = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
default_cats = c(gsub('"', '', c(sample(default_letters, rows, replace=TRUE))))
unique_default_cats = c()
for(i in 1:rows){
unique_default_cats[i] <- paste("x", i, sep="")
}
start_date <- as.Date("2020-01-01")
end_date <- as.Date("2025-01-01")
date_sequence <- seq.Date(from = start_date, to = end_date, by = "day")
default_dates <- sample(date_sequence, rows)
#m col is missinf values in it date_range is not randomized 
default_df <- function(rows, cols, date_col=NULL, date_range=NULL, int_col=NULL, int_ranges=NULL, letters_col=NULL, 
                       unique_letter_col=NULL, float_col=NULL, float_min=1, float_max=100,
                       boolean_col=NULL, missing=NULL, n_missing=0, distribution_col=NULL, 
                       dist_type = "normal", 
                       dist_params = list(mean = 50, sd = 10, size = 10, prob = 0.5)) {
df <- data.frame(matrix(ncol = cols, nrow = rows))
colnames(df) <- paste("V", 1:cols, sep = "")
add_column <- function(col_name, col_data){
  if (col_name %in% colnames(df)) {
    col_name <- paste(col_name, sum(colnames(df) == col_name) + 1, sep = "_")
  }
  df[[col_name]] <- col_data
}
  if (!is.null(date_col)) {
    if (is.null(start_date)) start_date <- as.Date('2020-01-01')  # Default start date
    if (is.null(end_date)) end_date <- Sys.Date()  # Default end date to today
    df[[date_col]] <- sample(seq(start_date, end_date, by = "day"), rows, replace = TRUE)
  }
if (!is.null(int_col) && !is.null(int_ranges)) {
  for (i in 1:length(int_col)) {
    col_name <- int_col[i]
    range <- int_ranges[[i]]
    
    # Ensure the range has both min and max values
    if (length(range) == 2) {
      add_column(col_name, sample(range[1]:range[2], rows, replace = TRUE))
    }
  }
}
return(df)
  }
  
dff <- default_df(rows=10, cols=3, int_col=c("Age", "height"), int_ranges=list(c(18,80), c(60,76)))

print(dff)        
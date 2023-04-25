## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
csutil::easy_split(letters[1:20], size_of_each_group = 3)
csutil::easy_split(letters[1:20], number_of_groups = 3)

## -----------------------------------------------------------------------------
x <- list(
  list(
    "a" = data.frame("v1"=1),
    "b" = data.frame("v2"=3)
  ),
  list(
    "a" = data.frame("v1"=10),
    "b" = data.frame("v2"=30),
    "d" = data.frame("v3"=50)
  )
)
print(x)
csutil::unnest_dfs_within_list_of_fully_named_lists(x)

## -----------------------------------------------------------------------------
csutil::is_fully_named_list(list(1))
csutil::is_fully_named_list(list("a"=1))

csutil::is_all_list_elements_null_or_df(list(data.frame()))
csutil::is_all_list_elements_null_or_df(list(1, NULL))

csutil::is_all_list_elements_null_or_list(list(1, NULL))
csutil::is_all_list_elements_null_or_list(list(list(), NULL))

csutil::is_all_list_elements_null_or_fully_named_list(list(list(), NULL))
csutil::is_all_list_elements_null_or_fully_named_list(list(list("a" = 1), NULL))

## -----------------------------------------------------------------------------
input <- rep(seq(as.Date("2000-01-01"), as.Date("2020-01-01"), 1), 1000)
a1 <- Sys.time()
z <- format(input, "%Y")
a2 <- Sys.time()
a2 - a1

b1 <- Sys.time()
z <- csutil::apply_fn_via_hash_table(
  input,
  format,
  "%Y"
)
b2 <- Sys.time()
b2 - b1


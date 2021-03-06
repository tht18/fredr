#' Find FRED series matching tag names
#'
#' Get the series matching tags in the `tag_names` parameter. Exclude tags in the
#' `exclude_tag_names` parameter.
#'
#' @inheritParams fredr_related_tags
#'
#' @param tag_names A semicolon delimited string of tag names to
#' find series using.
#'
#' @param order_by A string indicating which attribute by which to order the
#' results of the query.  Possible values include:
#'
#' * `"series_id"` (default)
#' * `"title"`
#' * `"units"`
#' * `"frequency"`
#' * `"seasonal_adjustment"`
#' * `"realtime_start"`
#' * `"realtime_end"`
#' * `"last_updated"`
#' * `"observation_start"`
#' * `"observation_end"`
#' * `"popularity"`
#' * `"group_popularity"`
#'
#' @return A `tibble` object containing FRED series with tags matching `tag_names`
#' and their descriptions.
#'
#' @section API Documentation:
#'
#' [fred/tags/series](https://fred.stlouisfed.org/docs/api/fred/tags_series.html)
#'
#' @seealso [fredr_category_tags()], [fredr_category_related_tags()], [fredr_docs()],
#' [fredr_release_tags()], [fredr_release_related_tags()],
#' [fredr_series_search_tags()], [fredr_series_search_related_tags()],
#' [fredr_tags()], [fredr_related_tags()]
#'
#' @examples
#'
#' if (fredr_has_key()) {
#' # All series tagged with "gdp"
#' fredr_tags_series(tag_names = "gdp")
#' # All series tagged with "gdp" and not tagged with "quarterly"
#' fredr_tags_series(
#'    tag_names = "gdp",
#'    exclude_tag_names = "quarterly"
#'  )
#' # Top 100 most popular non-quarterly series matching GDP
#' fredr_tags_series(
#'    tag_names = "gdp",
#'    exclude_tag_names = "quarterly",
#'    order_by = "popularity",
#'    limit = 100L
#' )
#' }
#' @export
fredr_tags_series <- function(tag_names,
                              ...,
                              exclude_tag_names = NULL,
                              limit = NULL,
                              offset = NULL,
                              order_by = NULL,
                              sort_order = NULL,
                              realtime_start = NULL,
                              realtime_end = NULL) {
  check_dots_empty(...)
  check_not_null(tag_names, "tag_names")

  user_args <- capture_args(
    tag_names = tag_names,
    exclude_tag_names = exclude_tag_names,
    realtime_start = realtime_start,
    realtime_end = realtime_end,
    limit = limit,
    offset = offset,
    order_by = order_by,
    sort_order = sort_order
  )

  fredr_args <- list(
    endpoint = "tags/series"
  )

  do.call(fredr_request, c(fredr_args, user_args))
}

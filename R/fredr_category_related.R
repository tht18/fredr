#' Get the related categories for a category.
#'
#' From the FRED API documentation: "A related category is a one-way relation
#' between 2 categories that is not part of a parent-child category hierarchy.
#' Most categories do not have related categories."
#'
#' @param category_id An integer ID for the category.  Default is `0` for the
#' root category. _Required parameter._
#'
#' @param realtime_start A `Date` indicating the start of the real-time period.
#' Defaults to today's date. For more information, see
#' [Real-Time Periods](https://research.stlouisfed.org/docs/api/fred/realtime_period.html).
#'
#' @param realtime_end A `Date` indicating the end of the real-time period.
#' Defaults to today's date. For more information, see
#' [Real-Time Periods](https://research.stlouisfed.org/docs/api/fred/realtime_period.html).
#'
#' @return A `tibble` object.
#'
#' @section API Documentation:
#'
#' [fred/category/related](https://research.stlouisfed.org/docs/api/fred/category_related.html)
#'
#' @seealso [fredr_category()], [fredr_category_children()],
#' [fredr_category_series()], [fredr_category_tags()], [fredr_category_related_tags()]
#'
#' @examples
#' \dontrun{
#' fredr_category_related()
#' }
#' @export
fredr_category_related <- function(category_id = 0L,
                                   realtime_start = NULL,
                                   realtime_end = NULL) {

  validate_category_id(category_id)

  user_args <- capture_args(
    category_id,
    realtime_start,
    realtime_end
  )

  fredr_args <- list(
    endpoint = "category/related"
  )

  do.call(fredr, c(fredr_args, user_args))

}
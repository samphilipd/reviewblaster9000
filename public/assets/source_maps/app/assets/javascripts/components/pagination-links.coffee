Rbnk.PaginationLinksComponent = Em.Component.extend
  hasPrevious: (->
    @get('page') > 1
  ).property('page')

  hasNext: (->
    @get('page') < @get('pages')
  ).property('page', 'pages')

  showPagination: Em.computed.gt('pages', 1)
  lastPage: Em.computed.alias('pages')

  visiblePages: (->
    pages = @get('pages')
    page  = @get('page')

    # limit the number of pages to five, or the number of pages
    # if that is smaller.
    limit = 5
    limit = pages if pages < 5

    # function to calculate the last page given a start position
    # and a limit
    finish   = (start,limit)->
      start + limit - 1

    # start at page - half the limit
    start = page - parseInt(limit / 2)
    # if that puts the last page shown as greater than the number
    # of pages, then move it back to the first start point that
    # doesn't cause an overrun.
    start = pages - limit + 1 if finish(start,limit) > pages
    # force start to the first page if the start is less than 1.
    start = 1 if start < 1

    [start..finish(start,limit)]
  ).property('page', 'pages')


  showBeforeElipsis: (->
    @get('visiblePages.firstObject') > 3
  ).property('visiblePages.[]')

  showAfterElipsis: (->
    Math.abs(@get('lastPage') - @get('visiblePages.lastObject')) > 2
  ).property('visiblePages.[]', 'lastPage')

  actions:
    goToNextPage: ->
      @incrementProperty('controller.page') if @get('hasNext')

    goToPreviousPage: ->
      @decrementProperty('controller.page') if @get('hasPrevious')

    goToPage: (pageNumber)->
      @set('controller.page', pageNumber) if pageNumber >= 1 && pageNumber <= @get('lastPage')


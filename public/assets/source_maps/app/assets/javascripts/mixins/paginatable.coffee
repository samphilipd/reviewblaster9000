Rbnk.PaginatableMixin = Em.Mixin.create
  paginatedContent: (->
    page = @get('page')
    perPage = @get('perPage')
    start = (page - 1) * perPage
    end = page * perPage
    @get('arrangedContent').slice(start, end)
  ).property('arrangedContent.[]', 'page', 'perPage')

  pages: (->
    result = parseInt(@get('content.length') / @get('perPage'))
    # select the ceiling of the pages in case there is a partial fill of the last
    if @get('content.length') % @get('perPage') > 0
      result += 1
    result
  ).property('content.[]', 'perPage')

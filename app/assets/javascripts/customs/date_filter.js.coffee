BiSalon.DateFilter =
  buildDateFilter: ->
    dateFilter = $('#filter_by_date')
    selectedDate   = dateFilter.find('input.filtered-date')

    filterByDate =
      filtered_date: selectedDate.val()

jQuery ->
  $('#btn-submit').click( ->
    selectedDate = BiSalon.DateFilter.buildDateFilter()
    BiSalon.Cookie.set('date_filter', encodeURIComponent(JSON.stringify(selectedDate)))
  )

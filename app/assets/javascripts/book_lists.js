Vue.component('book_list-row', {
  template: '#book_list-row',
  props: {
    book_list: Object
  }
})

var book_lists = new Vue({
  el: '#book_lists',
  data: {
    book_lists: [],
    book_list: {
      name: '',
      description: '',
      year: '',
      author: '',
      publisher: '',
      number_of_pages: ''
    },
    errors: {}
  },
  mounted : function() {
    console.log(",,as,da,")
    var that;
    that = this;
    $.ajax({
      url: '/book_lists.json',
      success: function(res) {
        that.book_lists = res;
      }
    });
  },
  methods: {
    addBookList: function () {
      var that = this;
      $.ajax({
        method: 'POST',
        data: {
          book_list: that.book_list,
        },
        url: '/book_lists.json',
        success: function(res) {
          that.errors = {}
          that.book_lists.push(res);
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
    }
  }
});

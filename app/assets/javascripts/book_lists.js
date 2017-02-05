Vue.component('book_list-row', {
  template: '#book_list-row',
  props: {
    book_list: Object
  },
  data: function () {
    return {
      editMode: false,
      errors: {}
    }
  },
  methods: {
    updateBookList: function () {
      var that = this;
      $.ajax({
        method: 'PUT',
        data: {
          book_list: that.book_list,
        },
        url: '/book_lists/' + that.book_list.id + '.json',
        success: function(res) {
          that.errors = {}
          that.book_list = res
          that.editMode = false
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
    },
    deleteBookList: function () {
      var that = this;
      $.ajax({
        method: 'DELETE',
        url: '/book_lists/' + that.book_list.id + '.json',
        success: function(res) {
          that.$el.remove()
        },
        error: function(res) {
          that.errors = res.responseJSON.errors
        }
      })
    }
  }
})

var book_lists = new Vue({
  el: '#book_lists',
  data: {
    book_lists: [],
    editMode: false,
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

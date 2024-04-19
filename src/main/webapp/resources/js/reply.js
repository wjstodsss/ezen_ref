console.log("Reply Module........");

var replyService = (function () {
  function add(reply, callback, error) {
    //데이타 저장
    console.log("reply............");

    $.ajax({
      type: "post",
      url: "/replies/new",
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }

function getList(param, callback, error) {
    //전체데이타 가져오기
    var bno = param.bno;

    var page = param.page || 1;

    $.ajax({
      type: "get",
      url: "/replies/pages/" + bno + "/" + page + ".json",

      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }
  
  function remove(rno, callback, error) {
    //데이타 삭제
    $.ajax({
      type: "delete",
      url: "/replies/" + rno,

      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }
  
  function update(reply, callback, error) {
    //테이타 수정
    $.ajax({
      type: "put",
      url: "/replies/" + reply.rno,
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",

      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }
  
  
   function get(rno, callback, error) {
    //단건 데이타 가져오기

    $.ajax({
      type: "get",
      url: "/replies/" + rno + ".json",

      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }
  
  return {
    add: add,
    getList: getList,
    remove: remove,
    update: update,
    get: get,
  };
})();

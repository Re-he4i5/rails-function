$(document).on("turbolinks:load", function () {
  $(document).on("input", ".search-word", function () {
    // tbodyの中身を一度空にする
    $(".book-index").html("");
    // 検索ワードの取得
    const keyword = $(this).val();
    // #indexにajax通信
    $.ajax({
      type: "GET",
      url: "/books",
      data: { keyword: keyword },
      dataType: "json",
    }).done(function (data) {
      data.forEach(function (data) {
        const html = `
          <tr>
            <td class='scroll_td'>${data.title}</td>
            <td class='scroll_td'>${data.body}</td>
          </tr>
        `;
        $(".book-index").prepend(html);
      });
    });
  });
});

import consumer from "./consumer"

if (location.pathname.match(/\/posts\/\d/)) {

  consumer.subscriptions.create({
    channel: "CommentChannel",
    post_id: location.pathname.match(/\d+/)[0]
  }, {

    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
      <div class="comment">
      <div class="user-info">
        <div class="user-name">
           ${data.user.nickname} さん
        </div>
      </div>
      <div class="user-comment">
        ${data.comment.text}
      </div>
    </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();  
    }
  })
}
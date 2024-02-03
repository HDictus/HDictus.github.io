// comments.js

document.addEventListener("DOMContentLoaded", function () {
    loadComments();
  });

  function loadComments() {
    try {_loadComments();} catch(error) {alert(error);}
  }

  function _loadComments() {
        // Fetch and display comments from the JSON file
    fetch('comments.json')
      .then(response => response.json())
      .then(comments => displayComments(comments))
      .catch(error => console.error('Error loading comments:', error));
  }
  
  function displayComments(comments) {
    const commentList = document.getElementById('comment-list');
    commentList.innerHTML = '';
  
    comments.forEach(comment => {
      const commentDiv = document.createElement('div');
      commentDiv.innerHTML = `<strong>${comment.author}</strong> (${comment.date}): ${comment.content}`;
      commentList.appendChild(commentDiv);
    });
  }
  
 function submitComment() {
    try{
      _submitComment();
    } catch (error) {
      alert(error)
    }
  }

async function _submitComment() {
    const author = document.getElementById('author').value; // Get the user's name or use a default
    const date = new Date().toISOString().split('T')[0]; // Get the current date
    const content = document.getElementById('comment-input').value;


    // Add the new comment to the existing comments
    const newComment = {author: author, date: date, content: content};

    try {

    await fetch('/writecomment', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(newComment),
      });

    loadComments()
    } catch (error) {
      alert(error);
    }
  }
  

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

document.addEventListener('turbo:load', () => {
  Prism.highlightAll();
  const commentBtn = document.querySelector('button[data-focus-comment]');
  const commentTextarea = document.querySelector('#comment-textarea');

  commentBtn.addEventListener('click', () => {
    commentTextarea.focus();
  });
});

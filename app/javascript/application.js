// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

document.addEventListener('turbo:load', () => {
  Prism.highlightAll();
  // Focusing the comment form
  const commentBtn = document.querySelector('button[data-focus-comment]');
  const commentTextarea = document.querySelector('#comment-textarea');

  commentBtn.addEventListener('click', () => {
    commentTextarea.focus();
  });

  // Copy to clipboard
  const copyBtn = document.querySelector('button[data-copy-link]');
  copyBtn.addEventListener('click', () => {
    const link = window.location.href;
    navigator.clipboard
      .writeText(link)
      .then(() => {
        console.log(link);
      })
      .catch((error) => {
        console.error('Failed to copy link:', error);
      });
  });
});

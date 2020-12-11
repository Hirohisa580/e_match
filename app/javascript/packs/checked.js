function check() {
  const boards = document.querySelectorAll(".board");
  boards.forEach(function (board) {
    board.addEventListener("click", () => {
      const boardId = board.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/boards/${boardId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const item = XHR.response.board;
        const list = document.getElementById("exp__main");
        const topic = document.getElementById("topic__title")
        const HTML = `
          <main class="exp__open">
              ${item.explanation}
          </main>`;
          // if (item.checked === true) {
            const expHtml = document.querySelector('main');
            if (expHtml){
              expHtml.remove();
            }
          list.insertAdjacentHTML("beforeend", HTML);
        // } else if (item.checked === false) {
        //    const exp__main = document.getElementById("exp__main")
        //    exp__main.innerHTML = "";
        // };
      };
    });
  });
}
window.addEventListener("load", check);


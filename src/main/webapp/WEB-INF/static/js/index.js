window.onload=function(){
    function removeActiveClass(node) {
        node.className = '';
    }

    document.querySelector('ul[id=navbar]').onclick = function (e) {
        Array.prototype.forEach.call(document.querySelectorAll('ul[id=navbar] > li'), removeActiveClass);
        var target = e.target;
        target.className = 'active';
    }
}
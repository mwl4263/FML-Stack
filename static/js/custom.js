window.onload = function() {
    document.getElementById("editButton").onclick = function() {
        if (document.getElementById("editButton").classList.contains("active")) {
            document.getElementById("editButton").classList.remove("active");
            document.getElementById("actionHead").classList.add("d-none")
            var x = document.querySelectorAll(".actionCol");
            x.forEach((element) => {
                element.classList.add("d-none");
            });
        } else {
            document.getElementById("editButton").classList.add("active");
            document.getElementById("actionHead").classList.remove("d-none");
            var x = document.querySelectorAll(".actionCol")
            x.forEach(element => {
                element.classList.remove("d-none");
            });
        }
    }
}
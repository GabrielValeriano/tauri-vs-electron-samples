import lottie from "lottie-web";
import { lottieJSONList } from "./lottie";
const animationList = [
  ...lottieJSONList,
  ...lottieJSONList,
  ...lottieJSONList,
  ...lottieJSONList,
  ...lottieJSONList,
];

window.addEventListener("DOMContentLoaded", () => {
  makeListOfAnimations();
});

function makeListOfAnimations() {
  const lottieDiv = document.getElementById("lottie");
  if (!lottieDiv || lottieDiv.childElementCount > 0) {
    return;
  }
  animationList.forEach((item) => {
    const div = document.createElement("div");
    div.style.cssText = "width:50px; height:50px;";
    lottieDiv.appendChild(div);

    lottie.loadAnimation({
      container: div,
      animationData: item,
      renderer: "svg",
      loop: true,
      autoplay: true,
    });
  });
}

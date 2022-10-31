import Lottie from "lottie-web";

import { useEffect } from "react";
import A from "./lottie/A.json";
import B from "./lottie/B.json";
import C from "./lottie/C.json";
import D from "./lottie/D.json";
import E from "./lottie/E.json";
import F from "./lottie/F.json";
import G from "./lottie/G.json";
import H from "./lottie/H.json";
import I from "./lottie/I.json";
import J from "./lottie/J.json";
import K from "./lottie/K.json";
import L from "./lottie/L.json";
import M from "./lottie/M.json";
import N from "./lottie/N.json";
import O from "./lottie/O.json";
import P from "./lottie/P.json";
import Q from "./lottie/Q.json";
import R from "./lottie/R.json";
import S from "./lottie/S.json";
import T from "./lottie/T.json";
import U from "./lottie/U.json";
import V from "./lottie/V.json";
import W from "./lottie/W.json";
import X from "./lottie/X.json";
import Y from "./lottie/Y.json";
import Z from "./lottie/Z.json";
import Apostrophe from "./lottie/Apostrophe.json";
import BlinkingCursor from "./lottie/BlinkingCursor.json";
import Colon from "./lottie/Colon.json";
import Comma from "./lottie/Comma.json";

const lottieJSONList = [
  A,
  B,
  C,
  D,
  E,
  F,
  G,
  H,
  I,
  J,
  K,
  L,
  M,
  N,
  O,
  P,
  Q,
  R,
  S,
  T,
  U,
  V,
  W,
  X,
  Y,
  Z,
  Apostrophe,
  BlinkingCursor,
  Colon,
  Comma,
];
const animationList = [
  ...lottieJSONList,
  ...lottieJSONList,
  ...lottieJSONList,
  ...lottieJSONList,
  ...lottieJSONList,
];
function App() {
  function makeListOfAnimations() {
    const lottieDiv = document.getElementById("lottie");
    if (!lottieDiv || lottieDiv.childElementCount > 0) {
      return;
    }
    animationList.forEach((item) => {
      let div = document.createElement("div");
      div.style.cssText = "width:50px; height:50px;";
      lottieDiv.appendChild(div);

      Lottie.loadAnimation({
        container: div,
        animationData: item,
        renderer: "svg",
        loop: true,
        autoplay: true,
      });
    });
  }
  useEffect(() => {
    makeListOfAnimations();
  }, []);
  return <div id="lottie" style={{ display: "flex", flexWrap: "wrap" }}></div>;
}

export default App;

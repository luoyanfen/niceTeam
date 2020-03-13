import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import axios from "axios";
axios.defaults.baseURL = 'http://localhost:8888';
Vue.prototype.$axios=axios; 

Vue.config.productionTip = false
Vue.use(ElementUI);



router.beforeEach((to,from,next)=>{
  if(to.path=="/ktv"||to.path=="/ktv-shop"){
    console.log("ktv")
   next();
  }else{
  (function(doc, win) {
  var docEl = doc.documentElement,
    resizeEvt =
      "orientationchange" in window ? "orientationchange" : "resize",
    recalc = function() {
      var clientWidth = docEl.clientWidth;
      if (!clientWidth) return;
      if (clientWidth >= 640) {
        docEl.style.fontSize = "100px";
      } else {
        docEl.style.fontSize = 100 * (clientWidth / 640) + "px";
      }
    };
  if (!doc.addEventListener) return;
  win.addEventListener(resizeEvt, recalc, false);
  doc.addEventListener("DOMContentLoaded", recalc, false);
})(document, window);
console.log(11)
next()
  }

})
new Vue({
  router,
  store,
  render: h => h(App),
 
}).$mount('#app')

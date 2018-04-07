import Vue from 'vue/dist/vue.esm';
import App from '../components/taskboard/App.vue';

new Vue({
  render: h => h(App),
}).$mount('#js-task-board')

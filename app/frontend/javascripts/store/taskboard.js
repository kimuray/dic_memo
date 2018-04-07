import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';

Vue.use(Vuex);

const state = {
  project: [
    {
      name: 'Line1',
      position: 0,
      tasks: [
        { id: 1, content: 'l1-task1', position: 0 },
        { id: 2, content: 'l1-task2', position: 1 },
        { id: 3, content: 'l1-task3', position: 2 },
      ]
    },
    {
      name: 'Line2',
      position: 1,
      tasks: [
        { id: 1, content: 'l2-task1', position: 0 },
        { id: 2, content: 'l2-task2', position: 1 },
        { id: 3, content: 'l2-task3', position: 2 },
      ]
    },
    {
      name: 'Line3',
      position: 2,
      tasks: [
        { id: 1, content: 'l3-task1', position: 0 },
        { id: 2, content: 'l3-task2', position: 1 },
        { id: 3, content: 'l3-task3', position: 2 },
      ]
    },
  ],
}

const getters = {

}

const actions = {

}

const mutations = {

}

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})

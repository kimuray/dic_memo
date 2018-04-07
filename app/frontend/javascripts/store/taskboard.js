import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';

Vue.use(Vuex);

const state = {
  project: [
    {
      id: 1,
      name: 'Line1',
      position: 0,
      tasks: [
        { id: 1, content: 'l1-task1', lineId: 1, position: 0 },
        { id: 2, content: 'l1-task2', lineId: 1, position: 1 },
        { id: 3, content: 'l1-task3', lineId: 1, position: 2 },
      ]
    },
    {
      id: 2,
      name: 'Line2',
      position: 1,
      tasks: [
        { id: 1, content: 'l2-task1', lineId: 2, position: 0 },
        { id: 2, content: 'l2-task2', lineId: 2, position: 1 },
        { id: 3, content: 'l2-task3', lineId: 2, position: 2 },
      ]
    },
    {
      id: 3,
      name: 'Line3',
      position: 2,
      tasks: [
        { id: 1, content: 'l3-task1', lineId: 3, position: 0 },
        { id: 2, content: 'l3-task2', lineId: 3, position: 1 },
        { id: 3, content: 'l3-task3', lineId: 3, position: 2 },
      ]
    },
  ],
}

const getters = {

}

const actions = {
  addTask: ({ commit }, task) => {
    commit('addTask', { task });
  },
  deleteTask: ({ commit }, task) => {
    commit('deleteTask', { task });
  },
  updateTask: ({ commit }, task) => {
    // TODO: この代入部分をAPI呼び出しにする
    task.content = task.tmpContent;
    commit('updateTask', { task });
  },
}

const mutations = {
  addTask(state, { task }) {
    const lineId = state.project.findIndex(({id}) => id === task.lineId);
    state.project[lineId].tasks.push(task);
  },
  deleteTask(state, { task }) {
    const lineId = state.project.findIndex(({id}) => id === task.lineId);
    const newTasks = state.project[lineId].tasks.filter(t => t.id !== task.id);
    state.project[lineId].tasks = newTasks;
  },
  updateTask(state, { task }) {
    const lineId = state.project.findIndex(({id}) => id === task.lineId);
    state.project[lineId].tasks.map(t => {
      return t.id === task.id ? task : t;
    });
  },
}

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})

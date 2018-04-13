import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
import { axios } from '../utils/http-client';

Vue.use(Vuex);

const state = {
  project: [],
}

const getters = {

}

const actions = {
  initializeProject: ({ commit }, projectId) => {
    axios.get(`/projects/${projectId}`).then(res => {
      state.project = res.data.project;
    });
  },
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

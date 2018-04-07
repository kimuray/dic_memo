import Vue from 'vue/dist/vue.esm';
import draggable from 'vuedraggable';

new Vue({
  el: '#js-task-board',
  components: {
    draggable,
  },
  data: {
    options: {
      group: 'project',
      animation: 100,
    },
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
    ]
  },
  methods: {

  }
});

<template>
  <div class="project">
    <div class="project-board">
      <div class="project-line" v-for="line in project">
        <div class="project-line-container">
          <div class="project-line-title">
            <h3 class="project-line-title-text">{{ line.name }}</h3>
          </div>

          <div class="project-line-list">
            <draggable :options="options" v-for="task in line.tasks">
              <a class="project-line-list-item">
                <div class="project-line-list-item-detail">
                  {{ task.content }}<br />
                  <div class="project-line-list-item-badges">
                    <span class="fa fa-edit project-line-list-item-badge"></span>
                    <span class="fa fa-trash project-line-list-item-badge"></span>
                  </div>
                </div>
              </a>
            </draggable>
          </div>
          <a class="project-line-add-link">タスク追加</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import draggable from 'vuedraggable';
import store from '../../store/taskboard';

export default {
  store,
  components: {
    draggable
  },
  data() {
    return {
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
    }
  }
}
</script>

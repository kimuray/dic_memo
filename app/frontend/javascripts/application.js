/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'stylesheets/application';
import Rails from 'rails-ujs';
import Vue from 'vue/dist/vue.esm';

require.context('images', true, /\.(png|jpg|jpeg|svg)$/)

Rails.start();

// TODO: Vueの配置場所を検討する必要あり
new Vue({
  el: '#js-menu',
  data: {
    isActive: false,
  },
  methods: {
    toggleMenu() {
      this.isActive = !this.isActive;
    }
  }
})

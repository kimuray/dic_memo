import axiosBase from 'axios';

const axios = axiosBase.create({
  baseURL: 'http://localhost:3000/api',
  responseType: 'json',
});

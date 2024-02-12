import axios from 'axios';

const API_GATEWAY_URL = 'http://localhost:8080';

const axiosInstance = axios.create({
  baseURL: API_GATEWAY_URL,
  timeout: 10000,
});

export default axiosInstance;

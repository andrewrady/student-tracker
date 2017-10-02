import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const state = {
    userId: '',
    error: '',
    showAdd: false,
    contracts: []
}

const mutations = {
    setUserId: (state, payload) => {
        state.userId = payload;
    },
    setError: (state, payload) => {
        state.error = payload;
    },
    toggleAdd: (state, payload) => {
        state.showAdd = payload;
    },
    setContracts: (state, payload) => {
        state.contracts = payload;
    }
}

const actions = {
    populateContracts:({commit, state}) => {
        axios({method: 'get', url: `http://localhost:3000/api/v1/users/${state.userId}/contracts/`})
            .then(res => {
                commit('setContracts', res.data);
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    },
    addContract:({commit, state, dispatch}, payload) => {
        axios({method: 'post', url: `http://localhost:3000/api/v1/users/${state.userId}/contracts/`, data: payload})
            .then(() => {
                dispatch('populateContracts');
                commit('toggleAdd', false);
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    },
    deleteContract:({commit, state, dispatch}, payload ) => {
        axios({method: 'delete', url: `http://localhost:3000/api/v1/users/${state.userId}/contracts/${payload}`})
            .then(() => {
                dispatch('populateContracts');
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    }
}

export default { state, mutations, actions };
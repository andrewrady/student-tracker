import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const state = {
    userId: '',
    error: '',
    contracts: []
}

const mutations = {
    setUserId: (state, payload) => {
        state.userId = payload;
    },
    setError: (state, payload) => {
        state.error = payload;
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
    }
}

export default { state, mutations, actions };
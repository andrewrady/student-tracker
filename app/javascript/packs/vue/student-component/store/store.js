import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const state = {
    userId: '',
    error: '',
    students: [],
    headOfHouse: [],
    showAdd: false,
    showContract: false
}

const mutations = {
    setError: ( state, payload ) => {
        state.error = payload;
    },
    setUserId: ( state, payload ) => {
        state.userId = payload;
    },
    toggleShow: ( state, payload ) => {
        state.showAdd = payload;
    },
    toggleContract: ( state, payload ) => {
        state.showContract = payload;
    },
    setStudentResults: (state, payload) => {
        state.students = payload;
    },
    setHeadOfHouse: ( state, payload ) => {
        state.headOfHouse = payload;
    }
}

const actions = {
    //api calls
    populateStudents: ({ commit, state }) => {
        axios({method: 'get', url: `http://localhost:3000/api/v1/users/${state.userId}/students`})
            .then(res => {
                commit('setStudentResults', res.data)
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    },
    populateHeadOfHouse: ({ commit, state }) => {
        axios({method: 'get', url: `http://localhost:3000/api/v1/users/${state.userId}/contracts`})
            .then(res => {
                let house = res.data.map(head => {
                    return { id: head.id, name: head.name }
                })
                commit('setHeadOfHouse', house);
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    },
    addStudent: ({ commit, state, dispatch }, payload ) => {
        axios({method: 'post', url: `http://localhost:3000/api/v1/users/${state.userId}/students`, data: payload})
            .then(() => {
                dispatch('populateStudents');
                commit('toggleShow', false);
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    },
    deleteStudent: ({commit, state, dispatch}, payload ) => {
        axios({method: 'delete', url: `http://localhost:3000/api/v1/users/${state.userId}/students/${payload}`})
            .then(() => {
                dispatch('populateStudents')
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    },
    addContracts: ({commit, state, dispatch }, payload) => {
        axios({method: 'post', url: `http://localhost:3000/api/v1/users/${state.userId}/contracts`, data: payload})
            .then(() => {
                dispatch('populateHeadOfHouse');
                commit('toggleContract', false)
            })
            .catch(err => {
                commit('setError', err.message);
                throw err;
            })
    }
}

export default { state, mutations, actions };
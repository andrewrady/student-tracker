import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const state = {
    userId: '',
    error: '',
    students: [],
    showAdd: false,
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
    setStudentResults: (state, payload) => {
        state.students = payload;
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
    }
}

export default { state, mutations, actions };
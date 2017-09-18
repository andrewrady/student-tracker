import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const state = {
    //states
    error: '',
    students: [],
}

const mutations = {
    //changes to state
    setError: ( state, payload ) => {
        state.error = payload;
    },
    setStudentResults: (state, payload) => {
        state.students = payload;
    }
}

const actions = {
    //api calls
    populateStudents: ({ commit, state }) => {
        axios({method: 'get', url: 'http://localhost:3000/api/v1/users/1/students'})
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
import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

const state = {
    userId: ''
}

const mutations = {
    setUserId: (state, payload) => {
        state.userId = payload;
    }
}

const actions = {

}

export default { state, mutations, actions };
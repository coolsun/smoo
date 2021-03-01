import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        isLoggedin: false,
        currentUserID: null,
        currentUserName: null,
        currentUserEmail: null,
        authToken: null
    },
    mutations: {
        setCurrentUser(state, { userID, userName, userEmail, authToken } ) {
            state.currentUserID = userID;
            state.currentUserName = userName;
            state.currentUserEmail = userEmail;
            state.authToken = authToken;
        }
    },
    actions: {
        getUserInfo() {
            axios.get('/api/users/sign_in')
        }
    }
});

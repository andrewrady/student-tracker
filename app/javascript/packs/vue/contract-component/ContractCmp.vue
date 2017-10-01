<template>
    <div class="ui grid">
        <div class="row">
            <div class="eleven wide column" v-if="!showAdd">
                <div class="ui top attached tabular menu">
                    <a class="item active">
                        Active List
                    </a>
                </div>
                <div class="ui bottom attached active tab segment contract">
                    <i class="icon add circle" @click="toggleAdd">Add</i>
                    <info-cmp v-for="(contract,index) in contracts" :key="index" :contract="contract"></info-cmp>
                </div>
            </div>
            <div class="eleven wide column" v-if="showAdd">
                <div class="ui attached segment">
                    <add-cmp></add-cmp>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex';
import infoCmp from './components/info-cmp.vue';
import addCmp from './components/add-cmp.vue';

export default {
    name: 'Contract-Component',
    components: {
        infoCmp,
        addCmp
    },
    computed: {
        ...mapState([
            'showAdd',
            'contracts'
        ])
    },
    mounted() {
        this.$store.dispatch('populateContracts');
    },
    methods: {
        toggleAdd() {
            this.$store.commit('toggleAdd', true);
        }
    }
}
</script>
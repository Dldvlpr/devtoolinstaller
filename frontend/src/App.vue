<template>
  <Index />
  <TermsModal />
  <PrivacyModal />
  <LicensesModal />
</template>

<script>
import { defineComponent } from "vue";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-icons/font/bootstrap-icons.css";
import Index from "@/components/Index.vue";
import TermsModal from "@/components/modals/TermsModal.vue";
import PrivacyModal from "@/components/modals/PrivacyModal.vue";
import LicensesModal from "@/components/modals/LicensesModal.vue";

export default defineComponent({
  name: "App",
  components: {
    Index,
    TermsModal,
    PrivacyModal,
    LicensesModal,
  },
});
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #212529;
}

body::before {
  content: "Work In Progress";
  position: fixed;
  width: 300px;
  height: 40px;
  background: #ffc107;
  color: #000;
  font-weight: bold;
  line-height: 40px;
  text-align: center;
  transform: rotate(45deg);
  top: 45px;
  right: -70px;
  z-index: 1001;
  font-family: "Arial", sans-serif;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.modal-content {
  background-color: #212529 !important;
}

.modal-header {
  border-bottom-color: #2c3034 !important;
}

.modal-footer {
  border-top-color: #2c3034 !important;
}

.modal-body {
  max-height: 70vh;
  overflow-y: auto;
}

.modal-body section {
  padding: 0.5rem;
}

.modal-body ul {
  padding-left: 1.5rem;
  margin-bottom: 1rem;
}

.modal-body li {
  margin-bottom: 0.5rem;
  color: #adb5bd;
}

.modal-body h6 {
  margin-bottom: 1rem;
}

.modal-body p {
  color: #adb5bd;
  line-height: 1.6;
}
</style>

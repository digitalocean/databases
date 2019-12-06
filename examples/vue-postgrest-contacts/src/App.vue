<template>
  <div class="mw6 center pa3 sans-serif">
    <h1 class="mb4">Contacts</h1>

    <p v-if="state == 'error'" class="orange">{{ error }}</p>
    <div v-else-if="state == 'ready'">
      <contact v-for="contact in contacts" :key="contact.id" :contact="contact" />
    </div>
    <p v-else-if="state == 'loading'">Loading contacts...</p>
  </div>
</template>

<script>
import Contact from "@/components/Contact.vue";
const apiBase = process.env.VUE_APP_API_BASE;

export default {
  name: "app",
  components: {
    Contact
  },
  data() {
    return {
      contacts: [],
      error: "",
      state: "loading"
    };
  },
  created() {
    this.loadContacts();
  },
  methods: {
    async loadContacts() {
      try {
        const contacts = await fetch(`${apiBase}/contacts`);
        this.contacts = await contacts.json();
        this.state = "ready";
      } catch (err) {
        this.error = err;
        this.state = "error";
      }
    }
  }
};
</script>
